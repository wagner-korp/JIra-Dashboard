
export interface RawJiraTicket {
  key: string;
  summary: string;
  assignee: string | null;
  reporter: string;
  status: string;
  priority: string;
  issueType: string;
  resolution: string | null;
  created: string;
  updated: string;
}

export interface JiraTicket extends Omit<RawJiraTicket, 'assignee' | 'resolution'> {
  assignee: string;
  resolution: string;
  createdDate: Date;
  updatedDate: Date;
}

export interface FilterState {
  status: string;
  priority: string;
  assignee: string;
  reporter: string;
  issueType: string;
  resolution: string;
}

export interface FilterOptions {
  statuses: string[];
  priorities: string[];
  assignees: string[];
  reporters: string[];
  issueTypes: string[];
  resolutions: string[];
}

export interface ChatMessage {
  id: string;
  sender: 'user' | 'bot';
  text: string;
}
